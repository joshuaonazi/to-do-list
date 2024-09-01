// Import the necessary modules (only if needed)
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Array "mo:base/Array";


actor ToDoList {

    // Define a data structure to store the tasks
    stable var initialTasks : [Text] = [];
    stable var addTasksCount : Nat = 0;

    // Function to add a task
    public func addTask(task: Text) {
        initialTasks := Array.append(initialTasks, [task]);  // Add the task to the list
        addTasksCount += 1;  // Increment the addTask count   
        Debug.print(debug_show(initialTasks));  // Print the current tasks for debugging
    };

    // Function to remove a task by its value
    public func removeTask(task: Text) {
        let filteredTasks = Array.filter<Text>(initialTasks, func (t) { t != task });
        if (Array.size(filteredTasks) < Array.size(initialTasks)) {
            initialTasks := filteredTasks;
            Debug.print(debug_show(initialTasks));  // Print the current tasks for debugging
        } else {
            Debug.print("Task not found!");
        }
    };

    // Function to view all tasks
    public query func viewTasks() : async [Text] {
        return initialTasks;
    };
}
