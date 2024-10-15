//
//  ContentView.swift
//  WeeklyTodo
//
//  Created by Audrey Patricia on 13/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mondayTasks: [Task] = []
    @State private var tuesdayTasks: [Task] = []
    @State private var wednesdayTasks: [Task] = []
    @State private var thursdayTasks: [Task] = []
    @State private var fridayTasks: [Task] = []
    @State private var saturdayTasks: [Task] = []
    @State private var sundayTasks: [Task] = []
    
    private let daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(daysOfTheWeek, id: \.self) {
                        DailyContainerView(
                            day: $0,
                            tasks: [
                                .init(title: "Task", note: "", isDone: true),
                                .init(title: "Task", note: "", isDone: false),
                                .init(title: "Task", note: "", isDone: false),
                                .init(title: "Task", note: "", isDone: true),
                                .init(title: "Task", note: "", isDone: true),
                                .init(title: "Task", note: "", isDone: true),
                                .init(title: "Task", note: "", isDone: true),
                            ]
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Weekly TODOs")
        }
    }
}

#Preview {
    ContentView()
}

struct DailyContainerView: View {
    let day: String
    let tasks: [Task]
    
    var body: some View {
        VStack {
            Text(day)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .bottom], 20)
            
            ZStack(alignment: .leading) {
                Color(.secondarySystemFill)
                    .cornerRadius(12)
                    .padding([.bottom, .top], -20)
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.id) { task in
                        taskView(task: task)
                            .padding(.horizontal, 20)
                    }
                }
            }
        }
    }
}

struct taskView: View {
    
    @State var task: Task
    
    var body: some View {
        Text(task.title)
            .padding(12)
            .foregroundColor(.black)
            .background(
                task.isDone
                ? Color(.systemGreen)
                : Color(uiColor: .secondarySystemGroupedBackground)
            )
            .cornerRadius(8)
            .shadow(radius: 1, x: 1, y: 1)
            .onTapGesture(count: 2) {
                task.isDone.toggle()
            }
    }
}
