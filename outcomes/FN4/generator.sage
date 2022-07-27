class Generator(BaseGenerator):
    def data(self):
        var('x y')
        
        clist = [ r"\text{Graph I}",r"\text{Graph II}",r"\text{Graph III}",r"\text{Graph IV}",r"\text{Graph V}",r"\text{Graph VI}",]
        
        [a,b]=[choice([True,False]),choice([True,False])]
        if(a): # y = x^2
            [A,B,C]=[QQ(randint(1,8)/randint(1,3)),randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])]
            A *= -1 if b else 1
            B *= -1 if (A*B > 0) else 1
            lhs = y
            rhs = A*x^2 + B*x + C
            j = 0 if A > 0 else 3
            answer = clist[j]
        else: # x = y^2
            [A,B,C]=[QQ(randint(1,8)/randint(1,3)),randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])]
            A *= -1 if b else 1
            B *= -1 if (A*B > 0) else 1
            lhs = x
            rhs = A*y^2 + B*y + C
            j = 2 if A > 0 else 5
            answer = clist[j]
        
        clist.pop(choice([1,4]))
        
        
        

        
        # shuffle(clist)
        
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
            "lhs": lhs,
            "rhs": rhs
        }