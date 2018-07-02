class gkey:
    def get_password(domain, user):
        with open('/home/yman/.config/i3/gpw', 'r') as pw:
            return pw.read()[:-1]
