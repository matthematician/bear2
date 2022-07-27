class Generator(BaseGenerator):
    def data(self):
        [a,b,d1,d2]=[2,2,2,2]
        while(a==b or d1==d2 or n1==d1 or n2==d2 or A==625 or B==625):
            [a,b]=[randint(2,5),randint(2,5)]
            [d1,d2]=[randint(2,4),randint(2,4)]
            [A,B]=[a^d1,b^d2]
            [n1,n2]=[randint(1,d1-1),randint(1,d1-1)]
        
        wronga = QQ(a^n1*b^n2)
        if(choice([True,False])):
            righta = QQ((b^n2)/(a^n1))
            n1 *= -1
        else:
            righta = QQ((a^n1)/(b^n2))
            n2 *= -1
            
        if(choice([True,False])):
            wrongtwo = -1*righta
        else:
            wrongtwo = -1*wronga
        
        clist = [  righta, wrongtwo , QQ(A*n1/d1*B*n2/d2), wronga ]
        
        answer = clist[0]
        
        shuffle(clist)
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]}
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "base1": A,
            "base2": B,
            "a": a,
            "b": b,
            "n1": n1,
            "n2": n2,
            "d1": d1,
            "d2": d2
        }
