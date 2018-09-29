Mincemeat
====================
Mincemeat is a Python implementation of the MapReduce distributed computing framework. 

### Steps.

1. I downloaded and installed ActivePython.

2. Install Python and make sure that Python home is in my OS Path.

3. Any computer with Python and mincemeat.py can be a part of cluster. Mincemeat.py is very light weight and it serves as a cluster.

4. Open two separate command prompt windows. One act as server, one act as client.

5. example.py is a script that runs on the server. Actual code is parsing the data text and go through map() and reduce() to print out the word count.

<hr>

<pre><code>
#!/usr/bin/env python
import mincemeat

data = ["Humpty Dumpty sat on a wall",
        "Humpty Dumpty had a great fall",
        "All the King's horses and all the King's men",
        "Couldn't put Humpty together again",
        ]

def mapfn(k, v):
    for w in v.split():
        yield w, 1

def reducefn(k, vs):
    result = 0
    for v in vs:
        result += v
    return result

s = mincemeat.Server()

# The data source can be any dictionary-like object
s.datasource = dict(enumerate(data))
s.mapfn = mapfn
s.reducefn = reducefn

results = s.run_server(password="changeme")
print results
</code></pre>
