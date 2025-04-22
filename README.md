About main codes

i) "runThruRecords_vXX.py" -- main code used to read binary data files and save as .mat and .npz  Used pre-spike sorting (before wave_clus)

ii) "adjustBeforeSorting_30mar25.m" -- runs sorting (wave_clus) && (before that) check/correct if data is double (needed to run waveClus)

Internal Functions:

i) "func_binary_to_mat_XX.py" -- function used inside (I)

ii) "continuous_ms_time.py" -- function used inside (I)

iii) "readBinaryFile.py" -- function used inside (i)


Main code: "runThruRecords_v3.py"

Read/organize data from each individually selected recording_site.

Read binary files as in32 or int16 depending on the file (.spikes or .wfm). Organize data considering the existence of a diverse number of trials and different recordings from the same recording site. This main code ("runThruRecords_v3.py") will call the others as needed.
Final data will be saved as .npz (python file) and also as .mat (matlab file) on the recording site folder.

Data/Project organization:
Consider the project called GLE. Each session is defined by a specific number (e.g., first session: gle01). Each session is composed by different recording sites (e.g., gle01a groups all data from the first electrode positioning). Neural activity was subjected to different experiemntal protocols that were individually recorded (e.g. gle01a01).


Example of data handling:
Choose the recording site you want read and group. For instance, gle05c (all the different protocols that were recorded in the position "c" of the session "05" of the project "gle")

1) open the script "runThruRecords_v3.py" and
2) inform/write on it the recordingSite you want to read (e.g., recordingSite = 'gle05c')
3) inform the searchPath of where your data is stored at (e.g.,searchPath = '/home/estevao/Documents/visLab/proj_gle_cat_2025/gle/')
4) check if the searchPath is correctly adjusted
5) check if outputPaths are correct


Obs:
Two Spike time arrays are created. One, has the time for each individual trial. The other, will concatenate the trial timing (and add 1000-ms between each) to avoid errors during the spike sorting (I'm still not sure if that is necessary... but it seems like I got better results using this version..)

