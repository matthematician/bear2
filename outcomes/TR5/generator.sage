class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        funcs = ["sin", "cos"]
        a = randint(2,6)
        i = randint(0,1)
        
        if(choice([True,False])): # a^2 ( 1 - func^2 ) = a^2 cofunc^2
            expr = str(a^2)+r" - "+str(a^2)+funcs[i]+r"^2 \,\theta"
            answer = str(a^2)+funcs[1-i]+r"^2 \,\theta"
            wr1 = str(a^2)+funcs[i]+r"^2 \,\theta"
            wr2 = choice([str(a),str(a^2)])+funcs[1-i]+r" \,\theta"
            wr3 = r"-"+str(a)+funcs[1-i]+r" \,\theta"
            wr4 = r"-"+str(a)+funcs[i]+r" \,\theta"
        else:
            expr = str(a^2)+funcs[i]+r"^2 \,\theta - "+str(a^2)
            answer = r"-"+str(a^2)+funcs[1-i]+r"^2 \,\theta"
            wr1 = r"-"+str(a^2)+funcs[1-i]+r"^2 \,\theta"
            wr2 = choice([str(a),str(a^2)])+funcs[1-i]+r" \,\theta"
            wr3 = r"-"+str(a)+funcs[1-i]+r" \,\theta"
            wr4 = r"-"+str(a)+funcs[i]+r" \,\theta"
        
        
        clist = [answer,wr1,wr2,wr3,wr4]
        shuffle(clist)
        
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
            "expr": expr
            
        }