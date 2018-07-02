class ckey:
    def get_password(domain, user):
        with open('/home/yman/.config/i3/cpw', 'r') as pw:
            return pw.read()[:-1]
