class Generator(BaseGenerator):
    def data(self):
        var('L W H')
 
        
        [A,B,C]=[1,2,3] # Constraint coefficients
        while(len(set([abs(x) for x in [A,B,C]])) != 2): # Want only two coefficients different
            [A,B,C] = [randint(1,4)*choice([-1,1]),randint(1,4)*choice([-1,1]),randint(1,4)*choice([-1,1])]
        
        if(A<0 and B<0 and C<0):
            A*=-1
            B*=-1
            C*=-1
        
        vars = [L, W, H]
        shuffle(vars)
        
        x = vars[0]
        y = vars[1]
        z = solve(A*L+B*W+C*H==0,vars[2])[0].rhs()
        
        clist = [
            (2*x+2*y+2*z).full_simplify(),(x*y*z).full_simplify(),z,(2*x+2*y-2*z).full_simplify()
        ]
        
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
            "eq": A*L+B*W+C*H == 0,
            "v1": vars[0],
            "v2": vars[1]
        }
