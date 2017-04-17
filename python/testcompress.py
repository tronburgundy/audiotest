#!/usr/bin/python

import argparse
import audiotools
import time

parser = argparse.ArgumentParser(description = "WAV to MP3 converter")
parser.add_argument("-d", "--debug", dest='DEBUG', help="Debugging Mode", action='store_true')
parser.add_argument("-i", "--input", type=str) 

global args
args = parser.parse_args()

class AudioTester:
    def __init__(self, raw):
        self.name = raw.partition('.')[0]
        self.raw = audiotools.open(raw)

    def compress(self, fmt_string):	
        start = time.time()
        if fmt_string == 'mp3':
            pcmraw = self.raw.to_pcm()
            self.mp3 = pcmraw.convert(self.name+'.mp3', audiotools.MP3Audio)
        end = time.time()
        return end-start

def main():
    tester = AudioTester(args.input)
    time = tester.compress("mp3")
    print("Time to compress: ", time)

    #TODO: Repeat with other algorithms

    #TODO: Analyze frequency spectrum of compressed/uncompressed

    #TODO: Convert compressed files back to WAV

if __name__ == "__main__":
    main()
