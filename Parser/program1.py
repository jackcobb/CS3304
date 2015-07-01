PF1 = '0!!!1/10&1!!&=1=0|'
PF2 = '10=!10/&11!0/=1|11!&|&0/'

tos = 0

def Push(stack,element):
	global tos
	stack[tos] = element
	tos += 1
	return

def Pop(stack):
	global tos
	tos -= 1
	return stack[tos]

def LogicalEval(expression):

	stack=[0]*len(expression)
	global tos
	tos = 0

	def Not (expr):
		# return not expr
		if expr == 0:
			return 1;
		else:
			return 0;
	def And (expr1, expr2):
		#return expr1&expr2
		if expr1 == 0 and expr2 ==0:
			return 0
		elif expr1 == 0 and expr2 ==1:
			return 0
		elif expr1 == 1 and expr2 == 0:
			return 0
		else:
			return 1
	def Not_equal (expr1, expr2):	
		# return 
		if expr1 != expr2:
			return 1
		else:
			return 0

	def Equal(expr1, expr2):
		# return if expr1 == expr2
		if expr1 == expr2:
			return 1
		else:
			return 0
	def Or (expr1, expr2):
		# return expr1|expr2
		if expr1 == 0 and expr2 ==0:
			return 0
		elif expr1 == 0 and expr2 ==1:
			return 1
		elif expr1 == 1 and expr2 == 0:
			return 1
		else:
			return 1
	
	for element in expression:
		if element =='!':
			Push(stack, Not(Pop(stack)))
		elif element =='&':
			Push(stack, And(Pop(stack), Pop(stack)))
		elif element =='/':
			Push(stack, Not_equal(Pop(stack), Pop(stack)))
		elif element =='=':
			Push(stack, Equal(Pop(stack), Pop(stack)))
		elif element =='|':
			Push(stack, Or(Pop(stack), Pop(stack)))
		else:
			Push(stack, element)

	print (Pop(stack))
	return
	
LogicalEval(PF1)
LogicalEval(PF2)
LogicalEval('11=0/0!&1|')