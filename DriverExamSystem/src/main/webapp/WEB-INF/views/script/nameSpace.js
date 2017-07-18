/**
 * 
 */
var SSH = SSH || {};

SSH.namespace = function(namespaceString) {
    if(namespaceString !== undefined){
        var parts = namespaceString.split('.'), parent = window, currentPart = SSH;

        for (var i = 0, length = parts.length; i < length; i++) {
            currentPart = parts[i];
            parent[currentPart] = parent[currentPart] || {};
            parent = parent[currentPart];
        }

        return parent;
    }
}