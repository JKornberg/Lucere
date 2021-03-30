import sys

from PyQt5.QtCore import pyqtSlot, QSortFilterProxyModel, Qt

class SortProxyModel(QSortFilterProxyModel):
    @pyqtSlot(str, int)
    def sortData(self, roleName, order):
        if order == Qt.InitialSortOrderRole:
            self.setSortRole(order)
            self.invalidate()
        else:
            roles = [key for key, value in self.roleNames().items() if value == roleName.encode()]
            if len(roles) > 0:
                self.setSortRole(roles[0])
                self.sort(0, order)