# Abstract 
This study investigated how specific micro-expressions displayed on a simulated robot face including eye shape, brow movement, mouth curvature, and color, influence human emotion recognition accuracy. Using a robot model developed in the Godot engine, six emotions (anger, fear, joy, love, sadness, and surprise) were presented to 15 participants across three micro-expression variants. Participants evaluated each display and identified the emotional state while also indicating which facial cues they relied on. Results showed consistent recognition confidence across emotions (M = 3.74–4.31), but substantial differences in cue usage. Eyes and mouth features emerged as the most dominant indicators, with eye cues being referenced between 41–92 percent of the time and mouth cues between 26–55 percent. Color and brow cues were used far less frequently. Love elicited the strongest eye-based recognition (92 percent), whereas emotions such as surprise and sadness showed more distributed cue reliance. Overall, the findings demonstrate that micro-expressions significantly shape emotional interpretation, with eye and mouth movements serving as the primary drivers of recognition.

# Robot Design
The robot model used in this study was based on popular robot designs, in particularly the Misty 2 and Pepper robot. In a review of the most commonly studied anthropomorphic robots, over 17% of robots used a screen combined with a face to communicate. This influenced the design of the robot model used in our study, which is a generic robot design with a large screen face. The final robot model was created in Blender.

<img width="290" height="370" alt="robot-with-materials" src="https://github.com/user-attachments/assets/9ffa5568-0c56-4157-974e-40af557b3425" />

# Expressions
A geometric style was chosen for the robot’s facial features. Geometric features (especially eyes) are preferred by users. In addition, in an analysis of 50+ robots, over 30% had eyes, eyebrows, a mouth, and cheeks. Accordingly, our robot has eyes, brows, and a mouth, as well as implied cheeks (the robot’s eyes can appear to be “pushed up” by the cheeks, but no explicit blush circles or similar are shown).

<img width="483" height="304" alt="Screenshot 2026-06-07 at 2 43 36 PM" src="https://github.com/user-attachments/assets/59e5db24-ec6c-455e-bdc7-fd6dbbfb075f" />
<img width="482" height="203" alt="Screenshot 2026-06-07 at 2 43 46 PM" src="https://github.com/user-attachments/assets/b06f3afb-89e3-439d-a1d0-d86367c5f91e" />
<img width="483" height="302" alt="Screenshot 2026-06-07 at 2 43 56 PM" src="https://github.com/user-attachments/assets/010518fe-30dd-4bf6-906e-1a1ca3bdb0fd" />


In total, we determined 13 eye cues, 6 brow cues, and 12 mouth cues to use in our robot’s expressions. In addition, we determined 6 colors, one for each basic emotion. The background of the robot’s face being black/dark gray necessitated the use of brighter colors to create contrast. Hue matters more in saturated colors than de-saturated ones, so previous literature on color–emotion associations was consulted. Pairs with a high percentage of supporting articles were selected, including blue–sadness (52.50%), red–anger (70.37%), pink–love (68.75%), and yellow–pleasure (90.24%). Associations for surprise were inconsistent, so we chose the strongest candidate, orange (17.65%). In addition, we chose green as our neutral color due to its association with relaxation in 34.29% of articles.

<img width="260" height="566" alt="Screenshot 2026-06-07 at 2 43 22 PM" src="https://github.com/user-attachments/assets/74efdbb1-7078-4ce0-9149-f47934009a12" />
