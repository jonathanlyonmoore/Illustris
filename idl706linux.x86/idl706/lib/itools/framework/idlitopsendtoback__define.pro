; $Id: //depot/idl/IDL_70/idldir/lib/itools/framework/idlitopsendtoback__define.pro#2 $
;
; Copyright (c) 2002-2008, ITT Visual Information Solutions. All
;       rights reserved. Unauthorized reproduction is prohibited.
;----------------------------------------------------------------------------
;;---------------------------------------------------------------------------
;; IDLitopSendToBack::DoAction
;;
;; Purpose:
;;
;; Parameters:
;; None.
;;
;-------------------------------------------------------------------------
function IDLitopSendToBack::DoAction, oTool

    compile_opt idl2, hidden

    return, self->IDLitopOrder::DoAction(oTool, 'Send to Back')
end


;-------------------------------------------------------------------------
pro IDLitopSendToBack__define

    compile_opt idl2, hidden
    struc = {IDLitopSendToBack, $
        inherits IDLitopOrder}

end

