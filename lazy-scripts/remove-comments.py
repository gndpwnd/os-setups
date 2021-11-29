import argparse

all_args = argparse.ArgumentParser()
all_args.add_argument("-i", "--infile", required=True,
   help="first Value")
all_args.add_argument("-o", "--outfile", required=True,
   help="second Value")
args = vars(all_args.parse_args())

inp = str(args['infile'])
outp = str(args['outfile'])

with open(inp) as oldfile, open(outp, 'w') as newfile:
    for line in oldfile:
        if not line.startswith("#"):
            newfile.write(line)
