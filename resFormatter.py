import sys
import json

def processresponse(line):
    if line.startswith('data: '):
        try:
            reqContent= line[6:]
            if reqContent.strip()=='[DONE]':
                return None
            
            data=json.loads(reqContent)
            if 'choices' in data and len(data['choices']) > 0:
                delta=data['choices'][0].get('delta',{})
                response=delta.get('content', '')
                if response:
                    print(response,end='',flush=True)
        except Exception as e:
            pass
    return True

def main():
    for line in sys.stdin:
        if not processresponse(line.strip()):
            break
    print() 
main()
