import re
class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        [c,d]=[randint(1,4),randint(1,4)]
        
        f(x) = ((x+c)*(x-d)).full_simplify()
        
        a = d + randint(1,3)
        b = a + randint(2,6)
        
        
        clist = [f(a)*(b-a),b-a,f(a),f(b)*(b-a),f(b)]
        answer = clist[0]
        
        clist.sort()
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
        ]
        
        ftext = re.sub('\*','',str(f(x)))
        
        return {
            "f": f(x),
            "answer": answer,
            "choices": ch,
            "a": a,
            "b": b,
            "fa": f(a),
            "fb": f(b),
            "ftext": ftext
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graph": plot(data['f'],(x,-1,data['b']+1),ticks=[[data['a'],data['b']],[]],figsize=[4,4], aspect_ratio='automatic')+polygon([(data['a'],0),(data['a'],data['fa']),(data['b'],data['fa']),(data['b'],0)],color='orange',figsize=[4,4],aspect_ratio='automatic')+text(r"$f(x)="+data['ftext']+r"$",(data['b'],data['fb']),color='blue',horizontal_alignment='right',vertical_alignment='bottom',figsize=[4,4],fontsize=18)
            }