import 'dart:io';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void printList(ListNode? list) {
  if (list == null) stdout.write("null");

  while (list != null) {
    stdout.write("${list.val} -> ");
    list = list.next;
  }

  stdout.write("\n");
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2, {int res = 0}) {
    if (l1 == null || l2 == null) return null;

    ListNode listResult = ListNode();
    ListNode? p = listResult;

    while (l1 != null && l2 != null) {
      int sum = l1.val + l2.val;

      if (sum + res > 9) {
        p!.next = ListNode((sum + res) % 10);
        res = 1;
      } else {
        p!.next = ListNode(sum + res);
        res = 0;
      }

      p = p.next;
      l1 = l1.next;
      l2 = l2.next;
    }

    if (l1 != null || l2 != null) {
      ListNode? l = l1 != null ? l1 : l2;
      ListNode? zeroList = ListNode(0);

      ListNode? temp1 = l;
      ListNode? temp2 = zeroList;

      while (temp1!.next != null) {
        temp2!.next = ListNode(0);
        temp2 = temp2.next;
        temp1 = temp1.next;
      }

      ListNode? otherList = addTwoNumbers(l, zeroList, res: res);
      res = 0;

      while (otherList != null) {
        p!.next = otherList;
        p = p.next;
        otherList = otherList.next;
      }
    }

    if (res != 0) p!.next = ListNode(res);

    return listResult.next;
  }
}

void main(List<String> args) {
  ListNode l1 = ListNode(1, ListNode(8));
  ListNode l2 = ListNode(0);

  /*   ListNode l1 = ListNode(
    9,
    ListNode(
      9,
      ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))),
    ),
  );
  ListNode l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))));
 */

  printList(l1);
  printList(l2);
  printList(Solution().addTwoNumbers(l1, l2));
}
