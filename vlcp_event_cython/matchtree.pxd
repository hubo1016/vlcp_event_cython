from vlcp_event_cython.event cimport Event, EventMatcher

cdef class MatchTree:
    '''
    A dictionary tree for fast event match
    '''
    cdef:
        dict _index
        list _matchers
        MatchTree parent
        int depth
        MatchTree _any
        object parentIndex
    cpdef MatchTree subtree(self, EventMatcher matcher, bint create = *)
    cpdef insert(self, EventMatcher matcher, obj)
    cpdef remove(self, EventMatcher matcher, obj)
    cpdef tuple matchesWithMatchers(self, Event event)
    cpdef tuple matches(self, Event event)
    cdef int _matches(self, Event event, set duptest, list retlist) except -1
    cpdef matchfirst(self, Event event)


cdef class EventTree:
    '''
    Store events; match matchers
    '''
    cdef:
        list _events
        list _subevents
        EventTree parent
        dict _index
        int depth
        int branch
        bint hassubtree
        object parentIndex
    cpdef EventTree subtree(self, Event event, bint create = *)
    cpdef insert(self, Event event)
    cdef int _returnAll(self, list ret) except -1
    cdef int _removeFromParent(self) except -1
    cdef int _findAndRemove(self, EventMatcher matcher, list ret) except -1
    cpdef findAndRemove(self, EventMatcher matcher)
    cpdef remove(self, Event event)

