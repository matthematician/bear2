class Generator(BaseGenerator):
    def data(self):
        var('x y')
        
        # Pick two lines in standard form, LHS only, could be parallel but don't make equal
        [A,B,C,D]=[1,2,-1,-2]
        while(A*D==B*C and abs(A)==abs(C)):
            [A,B,C,D] = [randint(1,8)*choice([-1,1]),randint(1,8)*choice([-1,1]),randint(1,8)*choice([-1,1]),randint(1,8)*choice([-1,1])]
        
        if(A<0 and B<0):
            [A,B] = [-1*A,-1*B]
        if(C<0 and D<0):
            [C,D] = [-1*C,-1*D]
        
        # Pick intersection point
        [xo,yo]=[1,1]
        [b1,b2]=[1,1]
        while(xo==yo  or b1==xo or b1==yo or b2==xo or b2==yo):
            [xo,yo]=[randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])]
            [b1,b2] = [A*xo+B*yo,C*xo+D*yo]

        # Compute rhses
        

        if(A*D-B*C==0): # Separate the parallel lines
            b2 += randint(1,4)*choice([-1,1])
        
        clist = [xo,yo,b1,b2]
        clist.sort()
        clist.append(r"\text{No intersection point exists.}")
        
        if(choice([True,False])):
            answer = xo
            coord = "x"
        else:
            answer = yo
            coord = "y"
        
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "lhs1": A*x+B*y,
            "lhs2": C*x+D*y,
            "rhs1": b1,
            "rhs2": b2,
            "coord": coord
        }