class Generator(BaseGenerator):
    def data(self):
        import re
        funcs = ["sin", "cos", "tan", "cot", "sec", "csc"]
        exps = [0,0,0,0,0,0]
        
        # Pick 3 of the funcs: one of sin/cos, one of tan/cot, one of sec/csc
        [i,j,k]=[randint(0,1),randint(2,3),randint(4,5)]
        f1 = funcs[i]
        f2 = funcs[j]
        f3 = funcs[k]
        
        # Pick 3 exponents, one of which should be 1, total sum no more than 5
        [e1,e2,e3] = [2,2,2]
        [sines,cosines]=[0,0]
        while(e1+e2+e3 > 5 or not 1 in [e1,e2,e3] or sines==cosines):
            [e1,e2,e3] = [randint(1,3),randint(1,3),randint(1,3)]
        
            exps[i] = e1
            exps[j] = e2
            exps[k] = e3

            sines = exps[0] + exps[2] - exps[3] - exps[5]
            cosines = exps[1] - exps[2] + exps[3] - exps[4]
        
        answer = ''
        wr1 = ''
        wr2 = ''
        if(sines > 0):
            esines = "" if sines == 1 else sines
            answer += r"\sin^{"+str(esines)+r"} \theta"        
            wr1 += r"\cos^{"+str(esines)+r"} \theta"
            wr2 += r"\csc^{"+str(esines)+r"} \theta"
        if(cosines < 0):
            secants = abs(cosines) if cosines < -1 else ""
            answer += r"\sec^{"+str(secants)+r"} \theta"            
            wr1 += r"\csc^{"+str(secants)+r"} \theta"
            wr2 += r"\cos^{"+str(secants)+r"} \theta"
        if(cosines > 0):
            ecosines = "" if cosines == 1 else cosines
            answer += r"\cos^{"+str(ecosines)+r"} \theta"
            wr1 += r"\sin^{"+str(ecosines)+r"} \theta"
            wr2 += r"\sec^{"+str(ecosines)+r"} \theta"
        if(sines < 0):
            cosecants = abs(sines) if sines < -1 else ""
            answer += r"\csc^{"+str(cosecants)+r"} \theta"
            wr1 += r"\sec^{"+str(cosecants)+r"} \theta"
            wr2 += r"\sin^{"+str(cosecants)+r"} \theta"

        wr3 = ''
        wr4 = ''
        if( answer.count('theta') > 1):  # chop up answer
            m = re.match('(.*?theta)(.*?theta)',answer)
            wr3 = m.group(1)
            wr4 = m.group(2)
            
        else: # augment answer
            if("sin" in answer or "csc" in answer):
                wr3 = answer+r"\cos\theta"
                wr4 = answer+r"\sec\theta"
            else:
                wr3 = answer+r"\sin\theta"
                wr4 = answer+r"\csc\theta"
                
        clist = [ answer,wr1,wr2,wr3,wr4 ]
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
            "f1": f1,
            "f2": f2,
            "f3": f3,
            "e1": e1 if e1>1 else "",
            "e2": e2 if e2>1 else "",
            "e3": e3 if e3>1 else ""
            
        }
