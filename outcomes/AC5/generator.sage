class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        vars = ['a', 'b', 'c', 'h', 'k', 'm', 'n', 'p', 't', 'u', 'w', 'z']
        shuffle(vars)
        y = var( vars[0] )
        
        expr = y + randint(1,5)*choice([-1,1])
        wexpr = expr - y + x
        
        [a,b,c,d]=[1,1,1,1]
        while(a*d-b*c==0 or c==0 or len([r for r in [a,b,c,d] if r==0])!=1): # Want one coefficient to be 0 but not a constant expr
            [a,b,c,d] = [randint(-5,5),randint(-5,5),randint(-5,5),randint(-5,5)]
        
        f(x) = (a*x+b)/(c*x+d)
        
        if(choice([True,False])):
            wronga = 1/f(expr)
        else:
            wronga = 1/f(wexpr)
        
        clist = [ f(expr),f(wexpr),(a*x*expr + b)/(c*x*expr+d),wronga]
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
            "f": f(x),
            "expr": expr
        }