glob
==================

` glob` has two functions that either return a list or an iterator of files in a directory using shell pattern matching. So, for example, to return a list of all jpg files in a directory:

<pre><code>
import glob
for file in glob.glob("*.jpg"):
    print file
</code></pre>
Introduced in Python 2.5, `iglob` is the other function in the module. It returns an iterator, which means the data isn’t all stored in one buffer or list in memory, but can be read out one at a time.

Take this interpreter session, for example:

<pre><code>
>>> import glob
>>> files = glob.glob("*.*")
>>> files
['default.jpg', 'my_generated_image.png', 'piltest.py', 'playbutton.png', 'playbutton.psd']
>>> files = glob.iglob("*.*")
>>> files
<generator object at 0x827d8>
>>> files.next()
'default.jpg'
>>> files.next()
'my_generated_image.png'
</code></pre>
Notice how each file name had to be popped out of the iterator individually? 
That’s useful in circumstances where you might have a huge number of files as a result of your glob query. 
The caveat is that you can’t go back in an iteration, so you’d best either store a few file names as you go, 
or be sure you’re done with the file before you call .next().


