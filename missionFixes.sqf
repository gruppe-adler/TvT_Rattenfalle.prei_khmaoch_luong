/* Bodybag an Oberfläche holen */

myPos = getPos (missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull]); 
(missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull]) setPos [myPos select 0, myPos select 1, 2]; 