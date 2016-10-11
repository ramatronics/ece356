with open('output.txt','r') as f:

	t = 0.0

	for line in f:
		if line.strip():
			if '(' in line:
				time = float(line.split('(')[1].split()[0])
				t+=time

	print t