# Modeling Hospital

# Patient
#STATE
- name -> String
- cured -> Boolean
#BEHAVIOR
- cured? -> return cured status
- cure! -> change cured from false to true

# Room
#STATE
- capacity -> Integer
- patients -> Array of Patients instances
#BEHAVIOR
- add_patient
- full? -> check if room is on full capacity or not
