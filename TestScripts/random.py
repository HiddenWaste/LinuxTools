import random as r

if __name__ == "__main__":
	max = input("What is the highest value for random?  ->")
	r.seed()

	num = r.randint(0, max)

	print(f"We got {num}")
