import math

"""This program asks the user to select one of the two available calculators: investment or mortgage calculator
and calculate the final value of an investment or monthly repayment value, repsepctively"""

#Presentation and selection of options.
print("investment - to calculate the amount of interest you'll earn on your innvestment")
print("bond - to calculate the amount you'll have to pay on a home loan")

calculator_choice=input("Enter either investment or bond from the menu above to proceed: ").lower()

"""If investment calculator is selected, the program asks input on deposit, interest rate, legth of investment
and whether the interest is simple or compound. When all the inputs are entered correctly, the program calculates
and shows on the screen the value of the investment at the end of the investment period"""

if calculator_choice=="investment":
    deposit_size=int(input("Please enter the deposit size : "))
    interest_rate=float(input('Please enter your interest rate : '))
    number_of_years=int(input('Please enter the number of years you plan on investing : '))
    interest=input("Please select compound or simple interest : ").lower()

    if interest == "simple":
        result=round(deposit_size*(1+(interest_rate/100)*number_of_years),1)
        print("You will reieve {} at the end of your investment period".format(result))
    elif interest == "compound":
        result=round(deposit_size*((1+(interest_rate/100))**number_of_years),1)
        print("You will reieve {} at the end of your investment period".format(result))   
    else: #if the user enters invalid input 
        print("Start from the start and select either simple or compound interest")

 #If the mortgage calculator is selected, the program asks input on the current value of the house, 
 #length of the mortgage, interest rate and shows on the screen the monthly repayment size."""
elif calculator_choice == "bond":
    house_value=int(input("Please enter the current value of your house : "))
    mortgage_rate=float(input("Please enter the interest rate on your mortgage : "))
    mortgage_length=int(input("Please enter the length of your loan in months : "))
    repayment = round((mortgage_rate*0.01/12)*house_value/(1-(1+(mortgage_rate*0.01/12))**(-mortgage_length)), 1)
    print("Your monthly repayment is {}".format(repayment))
else: #if the user enters invalid input 
    print("Please start from beginning and enter a valid input")
