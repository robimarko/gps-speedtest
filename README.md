# gps-speedtest

GPS Speedtest is a speedtest-cli shell script that will output speedtest info along with server id, time and GPS coordinates

It depends on Python2.7 and pynmea2 library as well as speedtest-cli.

So use pip to install:
	pip install pynmea2 speedtest-cli
  
Usage:
	./gps-speedtest.sh server-id output-filename
	
It will use a speedtest-cli --simple test with the provided server-id to test on the specified server instead of autoselection.
It will output test data as CSV and with the passed filename.

Output format is like this:
1878,12/26/18,23:52:20,61.639,0.00,61.58,45.541313,18.7025176667

Where:
	1878 is server-id for speedtest-cli
	12/26/18 is date
	23:52:20 is time
	61.639 is ping in ms
	0.00 is download speed in Mbits/s
	61.58 is upload speed in Mbits/s
	45.541313 is GPS latitude
	18.7025176667 is GPS longitude
	
You can also automate the tests with cron:
	crontab -e
	*/3 * * * * /home/pi/speedtest/gps-speedtest.sh 1878 results.csv > /dev/null 2>&1

This will run the script every 3 minutes on 1878 server-id and output result as results.csv file in the script folder.
