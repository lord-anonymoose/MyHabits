//
//  HabitsStore.swift
//  MyHabits
//
//  Created by Philipp Lazarev on 03.11.2023.
//

import UIKit

public final class Habit: Codable {
    
    public var name: String
    public var date: Date
    public var trackDates: [Date]
    
    public var color: UIColor {
        get {
            return .init(red: r, green: g, blue: b, alpha: a)
        }
        set {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            newValue.getRed(&r, green: &g, blue: &b, alpha: &a)
            self.r = r
            self.g = g
            self.b = b
            self.a = a
        }
    }

    // Habit completion time description
    public var dateString: String {
        "Daily at " + dateFormatter.string(from: date)
    }
    
    // Checks if habit is already done for today
    public var isAlreadyTakenToday: Bool {
        guard let lastTrackDate = trackDates.last else {
            return false
        }
        return calendar.isDateInToday(lastTrackDate)
    }
    
    private var r: CGFloat
    private var g: CGFloat
    private var b: CGFloat
    private var a: CGFloat
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeStyle = .short
        return formatter
    }()
    
    private lazy var calendar: Calendar = .current
    
    public init(name: String, date: Date, trackDates: [Date] = [], color: UIColor) {
        self.name = name
        self.date = date
        self.trackDates = trackDates
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}

extension Habit: Equatable {
    
    public static func == (lhs: Habit, rhs: Habit) -> Bool {
        lhs.name == rhs.name &&
        lhs.date == rhs.date &&
        lhs.trackDates == rhs.trackDates &&
        lhs.r == rhs.r &&
        lhs.g == rhs.g &&
        lhs.b == rhs.b &&
        lhs.a == rhs.a
    }
}

// Class for saving and changing habits
public final class HabitsStore {
    
    public static let shared: HabitsStore = .init()
    
    // List of added habits
    public var habits: [Habit] = [] {
        didSet {
            save()
        }
    }
    
    // All dates since app was installed
    public var dates: [Date] {
        guard let startDate = userDefaults.object(forKey: "start_date") as? Date else {
            return []
        }
        return Date.dates(from: startDate, to: .init())
    }
    
    // Counts today's progress (values from 0 to 1)
    public var todayProgress: Float {
        guard habits.isEmpty == false else {
            return 0
        }
        let takenTodayHabits = habits.filter { $0.isAlreadyTakenToday }
        return Float(takenTodayHabits.count) / Float(habits.count)
    }
    
    private lazy var userDefaults: UserDefaults = .standard
    
    private lazy var decoder: JSONDecoder = .init()
    
    private lazy var encoder: JSONEncoder = .init()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "ru_RU")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    private lazy var calendar: Calendar = .current
    
    // MARK: - Lifecycle
    
    // Saves all habit changes in UserDefaults.
    public func save() {
        do {
            let data = try encoder.encode(habits)
            userDefaults.setValue(data, forKey: "habits")
        }
        catch {
            print("Ошибка кодирования привычек для сохранения", error)
        }
    }
    
    // Track habits that was done today
    public func track(_ habit: Habit) {
        habit.trackDates.append(.init())
        save()
    }
    

    public func trackDateString(forIndex index: Int) -> String? {
        guard index < dates.count else {
            return nil
        }
        return dateFormatter.string(from: dates[index])
    }
    
    // Checks if habit was tracked on a certain day
    public func habit(_ habit: Habit, isTrackedIn date: Date) -> Bool {
        habit.trackDates.contains { trackDate in
            calendar.isDate(date, equalTo: trackDate, toGranularity: .day)
        }
    }
    
    // MARK: - Private
    
    private init() {
        if userDefaults.value(forKey: "start_date") == nil {
            let startDate = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: Date())) ?? Date()
            userDefaults.setValue(startDate, forKey: "start_date")
        }
        guard let data = userDefaults.data(forKey: "habits") else {
            return
        }
        do {
            habits = try decoder.decode([Habit].self, from: data)
        }
        catch {
            print("Ошибка декодирования сохранённых привычек", error)
        }
    }
}

private extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate

        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else {
                break
            }
            date = newDate
        }
        return dates
    }
}

public func removeTime(fromDate: Date) -> Date {
    guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: fromDate)) else {
        fatalError("Failed to strip time from Date object")
    }
    return date
}


public func getCurrentStrike(habit: Habit) -> Int {
    var dates = HabitsStore.shared.dates    
    var trackDates = habit.trackDates
    
    dates.sort(by: { $0 > $1 })
    trackDates.sort(by: { $0 > $1 })
    
    var strike = 1
    var i = 0
    
    if trackDates.isEmpty {
        return 0
    }
    
    if trackDates.first! == removeTime(fromDate: Date()) {
        dates.remove(at: 0)
    }
    
    while i < trackDates.count - 1 {
        if removeTime(fromDate: trackDates[i]) == removeTime(fromDate: dates[i]) {
            strike += 1
            i += 1
        } else {
            break
        }
    }
    return strike
}

public func dateToString(date: Date) -> String {
    let today = Date()
    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
    if removeTime(fromDate: date) == removeTime(fromDate: today) {
        return "Today"
    } else if removeTime(fromDate: date) == removeTime(fromDate: yesterday) {
        return "Yesterday"
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}

public func prepareDates(habit: Habit) -> [Date] {
    var availableDates = [Date]()
    for date in HabitsStore.shared.dates {
        if removeTime(fromDate: date) >= removeTime(fromDate: habit.trackDates.min() ?? Date()) {
            availableDates.append(date)
        }
    }
    availableDates.sort(by: { $0 > $1 })
    
    return availableDates
}

public func checkDate(date: Date, habit: Habit) -> Bool {
    var successfulDates = [Date]()
    for date in habit.trackDates {
        successfulDates.append(removeTime(fromDate: date))
    }
    return successfulDates.contains(removeTime(fromDate: date))
}
