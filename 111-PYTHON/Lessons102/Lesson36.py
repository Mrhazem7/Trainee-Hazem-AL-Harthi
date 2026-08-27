lst = [1, 2, 3, 4, 5]

# multiplied_list = []
#
# for num in lst:
#     if(num > 3) and num % 5 == 0:
#         multiplied_list.append(num*2)
#
# print(multiplied_list)

multiplied_list = [num*2 for num in lst if num > 3 and num % 5 == 0]
print(multiplied_list)