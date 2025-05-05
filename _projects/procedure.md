---
title: 'procedure'
date: 2024-10-19
permalink: /posts/2024/10/procedure/
tags:
  - C++
  - Qt
---

# introduction





# Situation
龙鳍®NicSys®2000高温堆HMI功能支持软件是一体化组态工具的一部分，主要用于为HMI功能所需的内容提供由用户进行配置的界面。

2000-HTGR-HMI project  is one part of CONFIG, the main purpose is to provide GUI for function that HMI need for uesr to config  
> HTGR: high-temperature gas-cooled reactor

# Task
通过规程离线组态功能实现对规程的离线组态相关操作，包括规程的新建、修改、逻辑组态、导入、导出、下装等功能项。

To implement the operation for procedure by procedure offline config , inlude create, update, config, import, export, deployment, and etc.



# Action
使用Qt开发一个插件
imporment a pugin by Qt framework
## trouble shooting
- 槽函数重复执行
    - 重复connect导致
        - 设置uniqueconnection
        - connect在constractor这种地方而不是重复执行的function
    - 设置debounce
    - slot function中设置condtion, 保证特定的状态下这个slot function只执行一次
- slot执行顺序错误
   - 都和parentocnnect
   - connect signal and signal
# Result

实现了规程的新建、修改、逻辑组态、导入、导出、下装等功能项



# useful command
```
D:\NicBuilder\CONFIG\src\plugins\nic.config.cx.procedure> C:\Qt\5.15.2\msvc2019_64\bin\lupdate.exe . -ts zh_CN.ts

C:\Qt\5.15.2\msvc2019_64\bin\linguist zh_CN.ts

C:\Qt\5.15.2\msvc2019_64\bin\lrelease zh_CN.ts

powershell.exe Get-Content D:\debug.log -Wait


Compare-Object (Get-Content main.cpp) (Get-Content maincopy.cpp)


git update-index --no-assume-unchanged CONFIG.pro
git update-index --assume-unchanged CONFIG.pro

```

# signal and slot relationship











```mermaid
graph LR


steps --> edit_stepdeleted(ProcedureEditWidget::step_delete_button_clicked)
edit_stepdeleted --> expression_remove(Expression::remove_step_expression)
steps --> steps_selected
steps_selected --> edit_stepselected(ProcedureEditWidget::step_selected)
steps --> steps_changed

edit_stepselected --> expression_syncstep(Expression::sync_step_expression)
edit_stepselected --> move_to_step(procedureBodyEditWidget::move_to_step)


steps_changed --> StepsWidget_sync_widget
steps_changed --> outlinechaged




list_item --> conditionhead_add(ConditionHeadWidget::add_condition_button_clicked) 



conditionhead_add  --> list_item_changed
list_item_changed --> outlinechaged

list_item --> list_item_selected(ProcedureListWidget_list_item_selected)

list_item_selected --> OutlineWidget_list_item_selected(OutlineWidget::list_item_selected)

OutlineWidget_list_item_selected --> expression_sync_conditon(Expression::sync_conditon_expression)

list_item --> condition_clicked

condition_clicked -->  move_position_to_condition(ProcedureBodyEditWidget::move_position_to_condition)




outlinechaged(OutlineWidget::outline_changed) --> edit_saveprocedure(ProcedureEditWidget::save_procedure 把m_procedure的数据更新到数据库中 ->c2)
outlinechaged --> body_syncwidget(ProcedureBodyEditWidget::sync_widget 把m_doc中的html渲染到body中 ->c1)






```




