#Run in console/terminal: python recur_max.py
# or just recur_max.py
# then type in the list of integers separated by commas & press enter
def Max(list):
    if len(list) == 1:
        return list[0]
    else:
        m = Max(list[1:])
        return m if m > list[0] else list[0]

def main():
    list = eval(raw_input(" please enter a list of numbers: "))
    print("the largest number is: ", Max(list))

main()