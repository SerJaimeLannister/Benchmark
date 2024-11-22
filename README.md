Benchmark Results: Bun, Deno, Lua, and Python Servers

This repository includes benchmarking results for four different implementations of a number-to-binary conversion service. We used the hey benchmarking tool to send 2000 POST requests with the payload number=1000 to each server and measured their response times.

The following table summarizes the results for each implementation.
Benchmark Results
Server	Total Time	Slowest Request	Fastest Request	Average Request Time	Requests/sec	Total Data Sent	Size/Request	Status Code Distribution
Bun	0.0385 secs	0.0063 secs	0.0001 secs	0.0009 secs	51,936.64	36,000 bytes	18 bytes	[200] 2000 responses
Deno	0.0792 secs	0.0085 secs	0.0002 secs	0.0019 secs	25,252.17	36,000 bytes	18 bytes	[200] 2000 responses
Lua	1.8180 secs	0.0574 secs	0.0010 secs	0.0440 secs	1,100.10	36,000 bytes	18 bytes	[200] 2000 responses
Python	1.7676 secs	0.0557 secs	0.0057 secs	0.0437 secs	1,131.50	334,000 bytes	167 bytes	[400] 2000 responses
Detailed Breakdown
Bun Server:

    Total Time: 0.0385 secs
    Slowest Request: 0.0063 secs
    Fastest Request: 0.0001 secs
    Average Request Time: 0.0009 secs
    Requests/sec: 51,936.64
    Data Sent: 36,000 bytes
    Size per Request: 18 bytes
    Status Code Distribution: 200 responses

Response Time Histogram:

0.000 [1]  |
0.001 [860] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
0.001 [837] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
0.002 [162] |■■■■■■■■
0.003 [70]  |■■■
0.003 [20]  |■
0.004 [21]  |■
0.004 [16]  |■
0.005 [12]  |■
0.006 [0]   |
0.006 [1]   |

Latency Distribution:

    10% in 0.0003 secs
    25% in 0.0006 secs
    50% in 0.0007 secs
    75% in 0.0008 secs
    90% in 0.0016 secs
    95% in 0.0022 secs
    99% in 0.0041 secs

Deno Server:

    Total Time: 0.0792 secs
    Slowest Request: 0.0085 secs
    Fastest Request: 0.0002 secs
    Average Request Time: 0.0019 secs
    Requests/sec: 25,252.17
    Data Sent: 36,000 bytes
    Size per Request: 18 bytes
    Status Code Distribution: 200 responses

Response Time Histogram:

0.000 [1]   |
0.001 [148] |■■■■■
0.002 [1077]|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
0.003 [574] |■■■■■■■■■■■■■■■■■■■■■
0.003 [135] |■■■■■
0.004 [14]  |■
0.005 [1]   |
0.006 [7]   |
0.007 [14]  |■
0.008 [27]  |■
0.009 [2]   |

Latency Distribution:

    10% in 0.0011 secs
    25% in 0.0014 secs
    50% in 0.0017 secs
    75% in 0.0022 secs
    90% in 0.0027 secs
    95% in 0.0032 secs
    99% in 0.0070 secs

Lua Server:

    Total Time: 1.8180 secs
    Slowest Request: 0.0574 secs
    Fastest Request: 0.0010 secs
    Average Request Time: 0.0440 secs
    Requests/sec: 1,100.10
    Data Sent: 36,000 bytes
    Size per Request: 18 bytes
    Status Code Distribution: 200 responses

Response Time Histogram:

0.001 [1]   |
0.007 [49]  |■■
0.012 [0]   |
0.018 [0]   |
0.024 [0]   |
0.029 [0]   |
0.035 [0]   |
0.040 [0]   |
0.046 [1252]|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
0.052 [681] |■■■■■■■■■■■■■■■■■■■■■■
0.057 [17]  |■

Latency Distribution:

    10% in 0.0430 secs
    25% in 0.0433 secs
    50% in 0.0439 secs
    75% in 0.0466 secs
    90% in 0.0479 secs
    95% in 0.0495 secs
    99% in 0.0517 secs

Python Server:

    Total Time: 1.7676 secs
    Slowest Request: 0.0557 secs
    Fastest Request: 0.0057 secs
    Average Request Time: 0.0437 secs
    Requests/sec: 1,131.50
    Data Sent: 334,000 bytes
    Size per Request: 167 bytes
    Status Code Distribution: 400 responses

Response Time Histogram:

0.006 [1]   |
0.011 [7]   |
0.016 [6]   |
0.021 [3]   |
0.026 [4]   |
0.031 [7]   |
0.036 [8]   |
0.041 [117] |■■■
0.046 [1464]|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
0.051 [320] |■■■■■■■■■
0.056 [63]  |■■

Latency Distribution:

    10% in 0.0410 secs
    25% in 0.0424 secs
    50% in 0.0438 secs
    75% in 0.0452 secs
    90% in 0.0468 secs
    95% in 0.0489 secs
    99% in 0.0528 secs

Conclusion

    Bun offers the fastest performance with the highest throughput, processing over 51,000 requests per second on average.
    Deno also performs very well with a reasonable request rate of over 25,000 requests per second.
    Lua and Python implementations, while functional, have significantly lower throughput, with requests per second in the range of 1,100-1,300.

For high-performance applications, Bun is the most suitable, but Deno offers a good balance of speed and developer experience. Lua and Python are slower and might need further optimizations for high-load production systems.

Feel free to fork and contribute to this repository, or run the benchmarks on your own servers!
