use NoblePublicSchool

--Way1 --Select all rows
Select * from Student

--Way2 --Select all rows and specified columns
Select EnrollmentNumber, Name, DOB, City from Student

Select * from Student

--select only unique records considering all columns value
select distinct * from Student

--selecting only unique records considering only specified columns
select distinct EnrollmentNumber,Name from Student
Select distinct EnrollmentNumber from Student


--filtering records
select * from Student where EnrollmentNumber='12345678'
select * from Student where EnrollmentNumber!='12345678'
select * from Student where EnrollmentNumber<>'12345678'
select * from Student where EnrollmentNumber in ('12345678','12345677','12345679')
select * from Student where EnrollmentNumber not in ('12345678','12345677','12345679')
select * from Student where EnrollmentNumber ='12345634' or EnrollmentNumber ='12345677' or EnrollmentNumber ='12345688'
Select * from Student where Age between 20 and 25
select * from Student where Age>=20 and Age<=25

select * from Student where EnrollmentNumber like '%3'
select * from Student where EnrollmentNumber not like '%3'
select * from Student where EnrollmentNumber not like '[^MTFS]%'

--wild card Characters are 
-- % - 0 or more character
-- - - exactly one character
-- [] any character within the bracket
-- [^] not any character within the bracket

--order by 
select * from Student order by EnrollmentNumber desc
select * from Student order by EnrollmentNumber asc

--multiple order by
select * from Student order by Name asc, EnrollmentNumber desc

--select top n rows
select top 5 * from Student
select top 5 name,city from student


--Group by and having
select Name,City ,count(*) as Counts from Student group by Name,City
select Name,City ,count(*) as Counts from Student group by Name,City having Count(*)<5
select month(enterDate) as enterMonth from work group by enterMonth
	X - Error - because Group by clause processed before select list so, enterMonth column will not available to group by.
	Solution - Derived Table











/*--Set Operators--
	Union All
	Union 
	Intersect
	Except
*/

select * from DUStudent
Union all
select * from IgnouStudent

select * from DUStudent where city='Ghaziabad'
Union
select * from IgnouStudent where city='Ghaziabad'


select * from DUStudent
Intersect
select * from IgnouStudent


select * from DUStudent
except
select * from IgnouStudent




/* Joins 
	Join
	Inner Join
	Outer Join		
		Left Outer Join or left join
		Right Outer Join or right join
		Full Outer Join or full join
*/

select * from DuStudent join Course
on DuStudent.Course = Course.CourseId

--or

select * from DuStudent as A inner join Course as C
on A.Course = C.CourseId


select * from DuStudent as A left join Course as C
on A.Course = C.CourseId

select * from DuStudent as A right join Course as C
on A.Course = C.CourseId


select * from DuStudent as A full join Course as C
on A.Course = C.CourseId


--left table non matching data
select * from DuStudent as A left join Course as C
on A.Course = C.CourseId
where A.Course is null

--right table non matching data
select * from DuStudent as A right join Course as C
on A.Course = C.CourseId
where A.Course is null

--both table non matching data
select * from DuStudent as A full join Course as C
on A.Course = C.CourseId
where A.Course is null


--special join ->self join (join on the same table)
select E.Name as Employee , M.Name as Manager from Employee as E left join Employee as M
on e.ManagerId=M.EmpId

select E.Name as Employee , M.Name as Manager from Employee as E inner join Employee as M
on e.ManagerId=M.EmpId

select E.Name as Employee ,isnull( M.Name,'No Manager') as Manager from Employee as E left join Employee as M
on e.ManagerId=M.EmpId



/*-- Derived Tables
Derived table is example of sub-query which always in From clause of Outer query and function as table for outer query. Derived tables are the result of inner query which work as a table for outer query.
Derived tables are the table expression (or temporary table) which are created on the fly (or in memory) with the help of SELECT statement and appears (or used or available) in FROM clause of outer query.

Scope :-
	Derived tables are limited (or available) to the outer select query only which created it. It cann't be used outside the scope of outside of the outer select query and drop automatically outside of it. so, derived tables are not part of db schema and not a real table.
	Derived tables are the result of inner query which work as a table for outer query.

uses :-
	Derived tables can be used to shorten long queries and to break complex process into logical steps
	Derived tables are good alternative of temporary tables
	Derived tables are used when use of column aliases are not possible because another clause is processed by sql translator before the alias name is processed.
		Eg :- Select month(enterDate) as EnterMonth from work group by enterMonth
		X - > here group by clause is processed before select statement so, alias name is not available to the group by clause hence error
		solution -> use drived table
		
Syntex of of creating and using Derived Tables:-

Select * from (derived table select statement) where <>

*/
--drived table as inner sub query and it' is using in outer select query.
Select * from (
				Select FilmName, FilmRuntimeMinutes from Tbl Film
			) where FilmRuntimeMinutes < 100

select EnterMonth from 
	(select month(enterDate) as enterMonth from work) as dt
	group by enterMonth


____________________________________________________________________________________
List

# List
List is basically a data structure consisting of :-
    1. Ordered elements :- i.e insertion order of elements is preserved
    2. duplicate elements allowed
    3. heterogeneous elements :- i.e elements in a set can be of any datatype
    4. indexed elements :- it is ordered data structure so, we can perform indexing operations on list.
    5. mutable :- it can be modified


Creating

# help(list)
# way1:- creating empty list
l1=[]  #create empty list

# Way2:- creating empty list
l2=list() #create empty list
print(l1)
print(l2)





# way2 :- using literals 
l1=list(["Hello","Hey","Hi"])
print(l1)
l2=["Hello","Hey","Hi"]
print(l2)

# note :-
# l1=list("hello","Hey","Hi")#Invalid syntext as list can take only one argument


# way3 :- using iterables.
# syntex:-
#     list(iterables)
#     new list initialized from iterable's items
#  set,tuple,lists,dict can be directly converted to lists.
# dict's keys are converted to list. dict's values are not considered.
iterable1=["Hello","hi","Bye"]
iterable2=("Hello","hi","Bye")
iterable3={"Hello","hi","Bye"}
iterable4={"Hello":1,"hi":2,"Bye":3}

l1=list(iterable1)
l2=list(iterable2)
l3=list(iterable3)
l4=list(iterable4)
# l10=list(iterable1,iterable2,iterable3,iterable4)


#1. l5,l6,l7,l8 are valid syntex but these not gives desired result. 
#     these syntexes creates a new list with  entire iterable as first item of the list.
# 2. if multiple iterables are provided together as arguments :-
#         to list(iterable1,iterable2,iterable3..) -> TypeError as list() takes only 1 argument
        # (iterable1,iterable2,iterable3...)-> every iterable becomes an element in the resulting tuple.


l5=[iterable1]
l6=[iterable2]
l7=[iterable3]
l8=[iterable4]
l9=[iterable1,iterable2,iterable3,iterable4]

print("By using list()")
print("list to list() ->",l1)
print("Tuple to list() ->",l2)
print("Set to list()",l3)
print("Dict to list()",l4)
# print("passed iterables together", l10)

print("By using symbol []")
print("list to [] ->",l5)
print("tuple to []",l6)
print("set to []",l7)
print("Dict to []",l8)
print("pass multiple iterables",l9)




# way4 -> using L.copy() method
# Syntex :- L.copy()->List
# list -- a shallow copy of L
l1=["Hello","Hi","Bye","Go","Come"]
l2=l1.copy()
print(id(l1),id(l2))
# It returns shallow copy of list, i.e. new list object is created but its 
#items are not newly created they are refrenced as of old list.



# way5 :- using slice operator
# Syntex :- L[:]->List
# it returns shallow copy of new List object
l1=["Hello","Hi","Bye","Go","Come"]
l2=l1[:]
print(id(l1),id(l2))

# Note :- List.copy() is equivalent to :- List[:] -> Both of these creates shallow copy of list.




### Adding/Inserting Items into List


# Syntex :- L.append(item)->None
#     It adds the item to the end of the list.
# if item is iterable then it append the iterable as a single item at the end of the list.
l1=["Hello","Hi","Bye","Go","Come"]
l2=[1,2,3,4,5]
l1.append("Gos")
r=l1.append(l2)
print(l1,r)


# Insert any item at the specified index.
# L.insert(index, object)->None -- insert object before index
#  if index==0, object is inserted at the starting of the list.
#    if index >=len(list), object is inserted at the end of the list.

l1=["Hello","Hi","Bye","Go","Come"]
r=l1.insert(5,"Come2")

# Note:-
# to insert at the first position provide index=0
l1.insert(0,"Come0")

# to insert at the end position provide index>=len(list)
l1.insert(len(l1),"lastCome")
l1.insert(len(l1)+2,"Very last")
print(l1,r)



# Insert item to the list by :- appending elements from the iterables to that list. 
#i.e. items from iterables are appended as the items to the list
# if we do this by append then entire iterable will be inserted as a single item to the list so, use extend()
# Syntex-> L.extend(iterable) -> None
# -- extend list by appending elements from the iterable

l1=["Hello","Hi","Bye","Go","Come"]
iterable2=("Hello2","hi2","Bye2")
iterable3={"Hello3","hi3","Bye3"}
iterable4={"Hello4":1,"hi4":2,"Bye4":3}
iterable5=("Hello2","hi2",{"Hello3","hi3","Bye3"})

l1.extend(iterable2)
l1.extend(iterable3)
l1.extend(iterable4)

l1.extend(iterable5)
print(l1)
# Note :- In append() the iterable is inserted as item into the list
#  but in extend() , the items of the iterable are appended to the list.
# items of the iterable are appended only at one loop iteration. agar 
#iterable k ander iterable hua to internal iterable as it is as an item append hoga.



### Delete item from list


# to delete all items from the list and make list empty
# Sytex:- L1.clear() ->None
#  It delete all the items from the list.
l1=["Hello","Hi","Bye","Go","Come"]
r=l1.clear()
print(l1,r)



# to delete item at the specific index.
# Syntex:- L.pop([index]) -> item 
# -- remove and return item at index (default last).
#  if index is not provided , by default last item is removed from index.
# Raises IndexError if list is empty or index is out of range.
# It is very useful method to use list as a stack or queue.

l1=["Hello","Hi","Bye","Go","Come"]
r1=l1.pop()
print(r1,l1)
r2=l1.pop(0)
print(r2,l1)
# r3=l1.pop(54) # Index Error , out of reange index.
# print(r3,l1)


print(l1)
print("before removing")
print(l1.pop(-1))#always remove last element from list
print(l1.pop(0)) # always remove first element from list
print("l1 after removing")
print(l1)



# to delete item at the specific index. by using del keyword

# Syntex:- del list[index]
# -- remove item at index
#  if index is not provided , complete list object is deleted
# Raises IndexError if list is empty or index is out of range.

l1=["Hello","Hi","Bye","Go","Come"]
del l1[1]
print(l1)
# del l1# complete list object is deleted so, raise NameError 
# print(l1)



# To delete item from the list by using value of item
# Syntex -> L.remove(valueOfItem) -> None 
# -- remove only first occurrence of value.
# Raises ValueError if the value is not present.

l1=["Hello","Hello","Hi","Bye","Go","Come"]
r1=l1.remove("Hello")
print(l1,r1)
# r2=l1.remove("Good Night") #ValueError provided value not in list.
# print(l1,r2)




# To delete item by slice.
# It 
l1=["Hello","Hi","Bye","Go","Come"]
del l1[3:4]
print(l1)



### Updating List


# Updating list by using index.
# Syntex:- list[index]=Value
# Value is set as item at the indexed position of list.
# IndexError is raised if index is out of bound
l1=["Hello","Hello","Hi","Bye","Go","Come"]
l1[0]="Yes"
print(l1)
# l1[89]="IndexError" raise IndexError , Index out of bounds.



## Accesing value from list


# By using index/position number
# Syntex :- L[index]->Value
# returns value at the specified index of the list
#Index must be < len(List) else IndexError
# raise IndexError if Index is out of range, 

l1=["Hello","Hello","Hi","Bye","Go","Come"]
v1=l1[1]
# v2=l1[len(l1)+1]# index > len(list) then IndexError
# v3=l1[len(l1)] # index = len(list) then IndexError
print(v1)
# print(v2)
# print(v3)


# By using index position
# Index will raise -> IndexError if indexing position is out of range of provided list
# first index position ->0
# last index position -> len(list)-1

l1=[ch for ch in "hello hey where are you 8424 23 23 432 4"]
print("first element",l1[0])
print("last element",l1[len(l1)-1])

#By using negative index position
#In negative index position :-
    #Last element is :- -1
    #then subtracting -1 as we go left in list element.
#     first element :-      -len(l)
print("last element",l1[-1])
print("first element",l1[-len(l1)])




#by using slicing operator -> :
# Syntex :- L[start:stop:step]->list(value)

# It returns the new list object
# It returns the shallow copy of list.
# It returns the list of values at index of :- list[start] to list[stop-1]
#  if start>=stop , then empty list is returned.
#  elif start<stop:
#         return list will :- list[start] to list[stop-1]
# if start > len(index) then empty list is returned.
# if start is omitted :- then returned list will :- list[0] to list[stop-1] 
#  if stop is ommitted :- then returned list will :- list[start] to list[len(list)-1] 
# if both start and stop are omitted then :- entire list is returned as it is -> list[0] to list[len(list)-1]

# when step is ommited then :- by default it is 1.
# From going start towords step -> each time step is added to start and next index is calculated.
# if step is positing -> then the next index is in forward direction.
# if index is negative -> then next index is in backword direction i.e. reverse direction.


l1=["Hello","Hello","Hi","Bye","Go","Come"]
v1=l1[3:3] # start==stop, returns empty list.
print(v1)
v2=l1[4:3]
print(v2)
v3=l1[:4]
print(v3)
v4=l1[4:]
print(v4)
v5=l1[:]
print("list objects",id(v5),id(l1))
print("values of list objects",id(v5[0]),id(l1[0]))
print(v5)

v6=l1[len(l1)+1:]
print(v6)


v7=l1[::-1]#list is reversed
print(v7)

v8=l1[::2]#taking list's every nth element
print(v8)

# Note :- 
# Slicing does not raise IndexError in any case.
# In every case it returns :- shallow copy of List (either empty or with values.)




l1=list(range(10,21))
# L.index(value, [start, [stop]]) -> integer -- return first index of value.
# Raises ValueError if the value is not present.

index12=l1.index(12)
print(index12)



# Slicing operator on list will work same on string also.
# Question on Slicing operator
url='http://coreyms.com'
print("Q1:- Reverse the url")
print("Ans1",url[::-1])
print("Q2 Get the top level domain")
print('Ans2:- ',url[-4:])
print("Q3:- print url without http")
print("Ans3 :- ",url[7:])
print("Q4 : print url without top level domain and without http")
print("Ans 4:- ",url[7:-4])



# using for and while loop

# only accessing values from the list
l = list(range(1,11))
for num in l:
    print(num)
    
#To access value from the list alongwith its index.
for index, num in enumerate(l):
    print(index, num)
    


# More Info of List

### Number of Items in list

l=list(range(10))
items=len(l)
print(items)

### Membership test

# In operator is use for membership test. it returns True or False
l=list(range(10,19))
print(1 in l)
print(11 in l)


# Reversing a list
# Way1
# L.reverse()->None it will reverse the list in place and return None
# reverse *IN PLACE*
    
l1=list(range(10))
print(l1)
l1.reverse()
# it will reverse the List in place
print(l1)


# Way2:-
l2=list(range(10,20))
print(l2)
print(l2[::-1])



# To convert list into string
l1=['hello','how','are ','you']
result=" Seperated Values ".join(l1)
print(result)



# Sorting a list

# Way1
# L.sort(key=None, reverse=False) -> None -- stable sort *IN PLACE*
# A custom key function can be supplied to customize the sort order, and the
    # A function that would server as a key or a basis of sort comparison.
#     key parameter is the functions that is passed to it.
#     key function transforms each element before sorting, it takes each value from list and returns 1 value
#     which is then used within sort instead of original value i.e orginal value will be sorted as per our
#     custom sorted function which will take one argument and return 1 argument.
# reverse flag can be set to request the result in descending order.

l1=list([1,2,2,3,4,5,5,5,3,1])
l1.sort()
print(l1)
l1=list([1,2,2,3,4,5,5,5,3,1])
l1.sort(reverse=True)
print(l1)

# Cutomizig Sort
lis=["hello","come","zebra","Chitresh"]
lis.sort(key=len)
print(lis)

# Way2:-
# sorted(iterable, /, *, key=None, reverse=False) -> list
# It will also sort the list but it will not alter the list in place it will create a new sorted list and return it
# Return a new list containing all items from the iterable in ascending order.
# A custom key function can be supplied to customize the sort order, and the
# reverse flag can be set to request the result in descending order.

l1=list([1,2,2,3,4,5,5,5,3,1])
sortedL1=sorted(l1)
print(l1)
print(sortedL1)





# Count number of times an element is in the list
l1=[1,2,3,4,4,5,5,4,3,2,21,1]

# L.count(value) -> integer -- return number of occurrences of value
# return 0 if value does not exists inside list
print(l1.count(1))
print(l1.count(56))



# finding regexed value at index
import pandas


l=["Apple","Aaloo","Aluminium"]
s=pandas.DataFrame(l)
s



s=s.reset_index()
s=s.set_index(0,True)
s



result=s.filter(regex=".*p.*",axis='rows')
result.shape


result


a="a"


chr(6)
def colNumber_String(n):
    result=""
    while n > 0:
        n, rem=divmod(n-1,26)
        result=chr(65+rem)+result
    return result

colNumber_String("A")


