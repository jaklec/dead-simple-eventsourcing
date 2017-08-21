# Dead Simple Eventsourcing

This project was made to demonstrate the most simplistic way to implement Eventsourcing I could think of.

## How it works

The system adds or subtracts numbers and generates a HTML view of the aggregate.

There is a CLI which consists of two bash scripts, `put.sh` and `get.sh`. PUT is used to issue update commands against the event log and it has the signature:
```./put.sh add|sub [integer]```

GET is used to receive the current state by aggregating all events.

There are two more scripts in the CLI, `index.sh` and `listen.sh`, which are used to generate the HTML view of the current state.
INDEX will read the entire log (similar to what GET is doing) and render the aggregate in the HTML view. Note that even though it is basically copying the work that GET is doing in this example, it has its own code base. In a real system, this would probably include some other logic than just aggregating the events.
LISTEN is listening to the event log and aggregates the events based on current state in the view.

## How to run
* Open a terminal and add a couple of events using the PUT endpoint. Now you can open the `log` to see the history of all events so far. 
* Run GET to see that you get the expected aggregate.
* Run INDEX to create the view. Inspect `view.html` (feel free to use a browser) and verify the number is what you expected.
* Run LISTEN from the background (or open up a new terminal window). Now run a couple of more updates (PUT) and verify that the view reflects the aggregate you expect to see.

## Disclaimer
This project is created for demo purpose only. Don't base any production system on these ideas!
