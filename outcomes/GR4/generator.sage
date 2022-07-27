class Generator(BaseGenerator):
    def data(self):
        
        clist = [
            "I only",
            "II only",
            "I and III",
            "II and IV",
            "I, II, III, and IV"
        ]
        # I is even through origin, II is odd, III *can* be even, IV is odd-shaped but not odd
        # I is graphs 1, 7, 11
        # II is graphs 4, 9, 13
        # III is graphs 16, 15, 12, 8, 2 -- 16 and 15 are even functions
        # IV is graphs 14, 10, 5, 3
        
        [i,ii,iii,iv]=[
            choice([1,7,11]),
            choice([4,9,13]),
            choice([16,15,12,8,2]),
            choice([14,10,5,3])
        ]
        
        if(choice([True,False])):
            sym = "even"
            symsign = ""
        else:
            sym = "odd"
            symsign = "-"
        
        if(sym == "odd"):
            answer = clist[1]
        else:
            answer = clist[2] if (iii>=15) else clist[0]
        
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
            "graphI": "graph"+str(i),
            "graphII": "graph"+str(ii),
            "graphIII": "graph"+str(iii),
            "graphIV": "graph"+str(iv),
            "f": 'f',
            "sym": sym,
            "symsign": symsign
            
        }