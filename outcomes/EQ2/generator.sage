class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        #Pick three distinct monomial roots, one of them rational
        [a,b,c]=[QQ(1),1,1]
        while(len(set([a,b,c]))<3 and a.denominator()==1):
            a = QQ(randint(1,9)*choice([-1,1])/randint(2,9))
            b = randint(1,9)
            c = -1*randint(1,9)
        
        roots = []
        
        expr = 1
        if(choice([True,False])):
            expr *= (a.denominator()*x - a.numerator())
            roots.append(a)
        else:
            expr /= (a.denominator()*x - a.numerator())
        
        if(choice([True,False])):
            expr *= (x - b)/(x-c)
            roots.append(b)
        else:
            expr *= (x-c)/(x-b)
            roots.append(c)
        
        clist = [
            r"x="+str(roots[0])+r"\text{ only}",
            r"x= \frac{"+str(a.numerator())+r"}{"+str(a.denominator())+r"}\text{ and }"+str(b)+r"\text{ only}",
            r"x= \frac{"+str(a.numerator())+r"}{"+str(a.denominator())+r"}\text{ and }"+str(c)+r"\text{ only}",
            r"x="+str(b)+r"\text{ and }"+str(c)+r"\text{ only}",
            r"x= \frac{"+str(a.numerator())+r"}{"+str(a.denominator())+"}, "+str(b)+r"\text{, and }"+str(c)
        ]
        
        answer = 0
        
        if(len(roots)==1):
            answer = clist[0]
        if(roots == [a,b]):
            answer = clist[1]
        if(roots == [a,c]):
            answer = clist[2]
        if(roots == [b,c]):
            answer = clist[3]
        
        shuffle(clist)
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]}
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "expr": expr
            
        }