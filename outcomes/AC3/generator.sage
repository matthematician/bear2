class Generator(BaseGenerator):
    def data(self):
        vars = ['a', 'b', 'd', 'h', 'k', 'm', 'n', 'p', 'r', 't', 'u', 'w', 'y']
        shuffle(vars)
        x = var( vars[0] )
        
        n1 = randint(2,12)*choice([1,5,10])*choice([-1,1])
        n2 = n1*choice([-1,2,-2])
        A = randint(2,12)*choice([-1,1])
        
        clist = [ A^(n2/n1),A*n2/n1,-A*n2/n1,A*n2 ]
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
            "n1": n1,
            "n2": n2,
            "A": A,
            "var": x
        }
