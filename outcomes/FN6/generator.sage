class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        [A,B,C,D]=[1,1,1,1]
        [xa,ya,xw,yw,xww] = [0,0,0,0,0]
        while(A*D==B*C or QQ(A/C).numerator()>2 or QQ(B/D).numerator()>2 or len(set([xa,ya,xw,yw,xww]))<5):
            [A,B,C,D]=[randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])]
            [xa,ya] = [QQ(-D/C),QQ(A/C)]
            [xw,yw] = [QQ(-B/A), QQ(B/D)]
            xww = 0
        
        
        clist = [ 
            r"\text{Horizontal: }y="+str(ya)+r",\quad \text{Vertical: }x="+str(xww),
            r"\text{Horizontal: }y="+str(ya)+r",\quad \text{Vertical: }x="+str(xw),
            r"\text{Horizontal: }y="+str(xa)+r",\quad \text{Vertical: }x="+str(ya),
            r"\text{Horizontal: }y="+str(xa)+r",\quad \text{Vertical: }x="+str(yw),
            r"\text{Horizontal: }y="+str(ya)+r",\quad \text{Vertical: }x="+str(xa),
            r"\text{Horizontal: }y="+str(xww)+r",\quad \text{Vertical: }x="+str(yw),
            r"\text{Horizontal: }y="+str(yw)+r",\quad \text{Vertical: }x="+str(xa),
            r"\text{Horizontal: }y="+str(yw)+r",\quad \text{Vertical: }x="+str(xww),
            r"\text{Horizontal: }y="+str(xww)+r",\quad \text{Vertical: }x="+str(ya)
        ] # All incorrect

        shuffle(clist)
        clist = clist[0:4]
        clist.append(r"\text{Vertical: }y="+str(ya)+r",\quad \text{Horizontal: }x="+str(xa))
        answer = r"\text{Vertical: }y="+str(ya)+r",\quad \text{Horizontal: }x="+str(xa)
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
            "num": A*x + B,
            "den": C*x + D
        }