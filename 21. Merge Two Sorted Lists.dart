import 'dart:io';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  void printList(ListNode? list1, String msg) {
    stdout.write(msg + " : ");
    if (list1 == null) {
      stdout.write("null\n");
      return;
    }

    ListNode? p = list1;
    while (p != null) {
      stdout.write(p.val.toString() + " -> ");
      p = p.next;
    }

    print("");
  }

  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null && list2 == null) return null;
    if (list1 == null) return list2;
    if (list2 == null) return list1;

    ListNode? p = ListNode(0, null);
    ListNode? sortedList = p;

    while (list1 != null && list2 != null) {
      if (list1.val <= list2.val) {
        p!.next = ListNode(list1.val, null);
        list1 = list1.next;
      } else {
        p!.next = ListNode(list2.val, null);
        list2 = list2.next;
      }

      p = p.next;
    }

    ListNode? others = list1 == null ? list2 : list1;

    while (others != null) {
      p!.next = others;
      p = p.next;
      others = others.next;
    }

    return sortedList.next;
  }
}

void main(List<String> args) {
  ListNode i3 = ListNode(3, null);
  ListNode i2 = ListNode(2, i3);
  ListNode list1 = ListNode(1, i2);

  ListNode r3 = ListNode(4, null);
  ListNode r2 = ListNode(3, r3);
  ListNode list2 = ListNode(1, r2);

  ListNode? merge = Solution().mergeTwoLists(list1, list2);

  Solution().printList(list1, "List 1");
  Solution().printList(list2, "List 2");
  Solution().printList(merge, "Merged");
}
