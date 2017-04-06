
import argparse
import audiotools
from timeit import timeit
import time

parser = argparse.ArgumentParser(description = "WAV to MP3 converter")
parser.add_argument("-d", "--debug", dest='DEBUG', help="Debugging Mode", action='store_true')

global args
args = parser.parse_args()
class AudioTester:
    def __init__(self, raw):
        self.name = raw.partition('.')[0]
        self.raw = audiotools.open(raw)

    def compress(self, fmt_string):	
        if fmt_string == 'au':
            self.au = self.raw.convert(self.name+'.au', audiotools.AuAudio)

def main():
    start = time.time()
    tester = AudioTester('music.wav')
    tester.compress("au")
    end = time.time()
    print("Time to compress: ", end-start)
    #TODO: Repeat with other algorithms
    #TODO: Analyze frequency spectrum of compressed/uncompressed
    #TODO: Convert compressed files back to WAV

if __name__ == "__main__":
    main()
