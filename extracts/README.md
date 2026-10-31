# HCM Extract design checklist

1. **Agree the vendor file layout** (fields, order, formats, delimiter, file name).
2. **Choose the extract type and data groups**, starting from the person or assignment level.
3. **Filter in the extract rules**, not in the output template.
4. **Changes only:** decide which attributes trigger a change and test new, changed and terminated people.
5. **Output template:** use a BI Publisher eText or Excel/RTF template that matches the layout exactly.
6. **Delivery:** UCM or SFTP, with a predictable file name and schedule.
7. **Test** with a known population and reconcile counts before going live.
