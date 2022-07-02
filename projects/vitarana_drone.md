# Vitarana Drone 
- Oct 2020 - Feb 2021

## Team:
- Rishav Singh
- Kashyap Joshi

## Technology:
- Python, Robot Operating System(ROS), Drone/Quadcopter, Gazebo, Git, Linux 
- Control System - PID
- Image Processing - QR Code Detection, Marker Detection

## Begining
- eYantra is an international robotics outreach program funded by the Ministry
  of Education and hosted at IIT Bombay.
- Total 2603 teams of 572 colleges in eYantra Robotics Competition 2020-21.

## Points to remember
- Participated in eYRC in our 2nd year of BTech.
- Started with 4 members but 2 left in between, we try to bring em on board but
  it was unavoidable. So work increased on 2 people.
- But still managed to divide the task in smaller, easily doable parts and
  divided according to the skills.
- Kashyap didn't knew about OOP concepts in Python, so he managed to learn
  along the way while implementing the tasks.

## Task 1
- We had to make working position and altitude controllers and reach the given setpoints.
- Took around 2 days to study the working of drone the roll, pitch, yaw and
  throttle mechanism.
- Took around 3-5 days to write and improve the mechanism and efficient
  workflow of PID controllers.
- Took more than 10 days to tune kp, ki, kd values for each direction and
  altitude untill we reached the satisfactory result.

## Task 2
- Next we moved forward for the object avoidance algorithm.
- We searched and studied about many path planning algorithms
- Considering we were given 4 sensors on 4 sides with 25 meters range each.
- Moved forward with using custom Bug algorithm for basic 2D object avoidance.
- Made ROS action for scanning Bar code on the delivery box and deliver it to the
  scanned location

## Task 3
- Improved the path finding algo for 3D environment to avoid objects by
  increasing the hight.
- Used image processing for detecting the landing markers to precisely land and
  drop the box over specified safe height from the marker.

## Task 4
- Now the work was to take delivery boxes from the warehouse grid and deliver
  it to the specified location
- Perfected the marker scanning mechanism to increase drone hight to scan more
  accurately.
- Improved the object avoidance algo.
- We were 1 day late to the deadline and had to make major changes in that
  single day of late submission with 25% penalty.

## Task 5
- Final Arena for the theme was provided, task was to deliver and pick as many
  boxes possible within 8 minutes of time. And markings were calculated
  according to the distance of the box from the initial location of drone.
- So in this race against the time we selected quality over quantity.
- We faced many difficulties like sometimes the markers were so near to each
  roof that drone scanned wrong marker sometimes. So we had to resolve the
  issue by taking the nearest path to the provided approx location of marker.
- We had 2 choices either to deliver near boxes first to increase number of
  boxes or to deliver furthest boxes first to maximize distance points.
- We selected the later one because our algo was taking more time to detect and
  land on marker.
- We also implemented velocity controller for gaining extra speed during no
  obstacle path.

## Task 6
- Last task was same problem statement as Task 5 but more difficult delivery
  and pick locations and were given only 2 days for final submission unlike
  other tasks.
- We improved overall code and connections between each controller to avoid
  unexpected mistakes and crashes.
- We wrote the code documentation for each file on the last night of
  submission(will never forget that horrifying, sleepy night). Me and my
  partner waking up each other after taking 10 min power naps.
- Got nice marks but were not in top 6 teams so did not reach finals.

## Conclusion
- Although we only reached till the pre-finals round but learned lots of
  technical and team management skills for life.
- Main difference between our solution and top 6 solution was that we focused
  more on stability over speed.
