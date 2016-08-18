cdef class Event


cdef class EventMatcher:
    cdef readonly tuple indices
    cdef object _judge
    cpdef bint judge(self, Event event)
    cpdef bint isMatch(self, Event event, int indexStart = *)

cdef class Event:
    cdef readonly tuple indices


