class Generator(BaseGenerator):
    def data(self):
        
        time1 = randint(2,20)
        time2 = time1*choice([3,4,5])
        
        clist = [ 2^(time2/time1), 2*time2/time1, exp(time2/time1), exp(time2)]
        
        
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
            "time1": time1,
            "time2": time2
        }