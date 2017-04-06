
import argparse
import audiotools
from timeit import timeit
import time

parser = argparse.ArgumentParser(description = "WAV to MP3 converter")
parser.add_argument("-d", "--debug", dest='DEBUG', help="Debugging Mode", action='store_true')
parser.add_argument("-i", "--input") 

global args
args = parser.parse_args()

class AudioTester:
    def __init__(self, raw):
        self.name = raw.partition('.')[0]
        self.raw = audiotools.open(raw)

    def compress(self, fmt_string):	
        start = time.time()
        if fmt_string == 'mp3':
            self.mp3 = self.raw.convert(self.name+'.mp3', audiotools.MP3Audio)

def main():
    tester = AudioTester('music.wav')
    tester.compress("mp3")
    # Start timer
    #time = timeit("tomp3()",setup="from __main__ import tomp3", number=1)
    end = time.time()
    print("Time to compress: ", end-start)
    #TODO: Repeat with other algorithms
    #TODO: Analyze frequency spectrum of compressed/uncompressed
    #TODO: Convert compressed files back to WAV

if __name__ == "__main__":
    main()
