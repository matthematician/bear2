class Generator(BaseGenerator):
    def data(self):
        var('x y')
        
        clist = [ r"\text{Graph I}",r"\text{Graph II}",r"\text{Graph III}",r"\text{Graph IV}",r"\text{Graph V}",r"\text{Graph VI}",]
        
        [a,b]=[choice([True,False]),choice([True,False])]
        if(a): # y = B^x
            den = randint(1,5)
            num = randint(den+1,4*den)
            B = QQ(num/den) if b else QQ(den/num)
            lhs = y
            exponent = x
            j = 0 if B > 1 else 3
            answer = clist[j]
        else: # y = B^-x
            den = randint(1,5)
            num = randint(den+1,4*den)
            B = QQ(num/den) if b else QQ(den/num)
            lhs = y
            exponent = -x
            j = 3 if B > 1 else 0
            answer = clist[j]
        
        clist.pop(choice([2,5]))
        
        
        

        
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
            "exponent": exponent,
            "base": B,
            "lparen": r"\bigl(" if B.denominator()>1 else "",
            "rparen": r"\bigr)" if B.denominator()>1 else ""
            
        }