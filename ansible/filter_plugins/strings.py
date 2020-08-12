import ansible.errors


class FilterModule(object):
    def filters(self):
        return {
            'split': self.split,
        }

    def split(self, input_string, sep=None, maxsplit=-1):
        if not isinstance(input_string, str) and not isinstance(input_string, unicode):
            raise ansible.errors.AnsibleFilterError("Split allowed only for strings, given: {!s}".format(type(input_string)))
        else:
            return input_string.split(sep, maxsplit)
