# sales-tax-calculator
Sales Tax Calculator  Challenge (+Subscribe)

# Problem Statement
***
This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:
***
### INPUT:

*Input 1*:
>2 book at 12.49  
>1 music CD at 14.99  
>1 chocolate bar at 0.85  

*Input 2*:
>1 imported box of chocolates at 10.00  
>1 imported bottle of perfume at 47.50  

*Input 3*:
>1 imported bottle of perfume at 27.99  
>1 bottle of perfume at 18.99  
>1 packet of headache pills at 9.75  
>3 box of imported chocolates at 11.25  

### OUTPUT

*Output 1*:
>2 book : 24.98  
>1 music CD: 16.49  
>1 chocolate bar: 0.85  
>Sales Taxes: 1.50  
>Total: 42.32 

*Output 2*:
>1 imported box of chocolates: 10.50  
>1 imported bottle of perfume: 54.65  
>Sales Taxes: 7.65  
>Total: 65.15  

*Output 3*:
>1 imported bottle of perfume: 32.19  
>1 bottle of perfume: 20.89  
>1 packet of headache pills: 9.75  
>3 imported box of chocolates: 11.85  
>Sales Taxes: 7.90
>Total: 98.38  
  
***


### How to Run
`ruby generate.rb <filename>.txt`  
*Note*: 3 files from the problem have been included for use.  
#### Input Files:
- input1.txt
- input2.txt
- input3.txt
  
***

### Assumptions
1. The input text file follows the following syntax:
    <pre>
      1 book at 12.49
      qty, name, "at", price
    </pre>
2. Product Quantity is a positive integer greater than 0
3. Price is a positive number
4. Items to be excluded from the goods sales tax (10%) is included in a text file called `exclusions.txt` placed in the input folder.
5. Imported items have the word `imported` in them.
  
***


By knowing where "at" is located, which is index 2, we can assume anything between index 0 (which would be qty) and index 2 ("at") is the item name (index 0+1 to index 2-1). The price would be located at index 3 (index 2+1).  

So a hash is built with the following:
> name: string  
> qty: integer  
> price: float  
> good: boolean  
> import: boolean  
> good_tax: float  
> import_tax: float  
> sales_tax: float  
> total: float  

`good` and `import` act as flags which signal whether or not good tax or import tax should be applied.  

`good_tax`, `import_tax`, `sales_tax`, are initially set to 0.0 and will be updated via `calculator`. `Total` is simply set to `qty` * `price` and will be updated by calculator.  

