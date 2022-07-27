class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        [dx,dy] = choice([ [3,4], [6,8], [4,3], [8,6] ])
        if(choice([True,False])):
            dy *= -1
        
        a = [0,0]
        b = [0,0]
        c = [0,0]
        
        while(a==c or max([abs(r) for r in [a[0],a[1],c[0],c[1]]] )>9 ):
            a = [randint(-8,8),randint(-8,8)]
            c = [a[0]+dx, a[1]+dy]
            b = [c[0],a[1]]
        
        clist = [sqrt(dx^2+dy^2),abs(dx),abs(dy),sqrt(a[0]^2+a[1]^2),sqrt(c[0]^2+c[1]^2)]
        answer = clist[0]
        
        clist.sort()
        
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
            "ax": a[0],
            "ay": a[1],
            "cx": c[0],
            "cy": c[1],
            "bx": b[0],
            "by": b[1],
            "a": tuple(a),
            "b": tuple(b),
            "c": tuple(c)
           
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "triangle": line([data['a'],data['b'],data['c'],data['a']], color='blue', thickness=2,aspect_ratio=1)+point([data['a'],data['b'],data['c']],size=48,color='black')+point([[-10,0],[10,0],[0,10],[0,-10]],size=1, color='black')+text("$A(%s,%s)$"%(data['ax'],data['ay']),data['a'],horizontal_alignment='right')+text("$B(%s,%s)$"%(data['bx'],data['by']),data['b'],horizontal_alignment='left')+text("$C(%s,%s)$"%(data['cx'],data['cy']),data['c'],horizontal_alignment='left')
            }