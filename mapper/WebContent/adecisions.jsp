<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<data>
<uncovereddiv>
<table>
<form action="">
  <tr style="background-color: #808080">
    <c:forEach items="${initiative.diagonalContentMappings}" var="map">
      <th style="width: 30%; font-size: 120%">${map.base}</th>
    </c:forEach>
  </tr>
  <c:forEach items="${typesMatrix}" var="elements" varStatus="loop">
    <tr style="background-color: #c8c8c8">
      <td colspan="100%">${ufotypes[loop.index]}<c:if test="${empty ufotypes[loop.index]}">Type not defined</c:if>
      </td>
    </tr>
    <c:forEach items="${elements}" var="row">
      <tr>
        <c:forEach items="${row}" var="cell">
          <td class='${cell[2]}'>
            <div style="font-size: 90%">
              <c:if test="${not empty cell[0]}">
                <input type="radio" name="element" onclick="selectElement('${cell[0].id}', '${cell[0]}')" value="${cell[0].id}"><label title="Definition: ${cell[0].definition}"> ${cell[0]}</label>
                <div style="float: right; display: inline">
                  <c:if test="${not empty cell[1]}">
                    <label title="${cell[1]}">[M]</label>
                  </c:if>
                </div>
              </c:if>
            </div>
          </td>
        </c:forEach>
      </tr>
    </c:forEach>
  </c:forEach>
</form>
</table>
</uncovereddiv>

<coveragelabel>
  <c:forEach items="${coverages}" var="stdcover">
    &nbsp;&nbsp;&nbsp;(Coverage ${stdcover[0]}: ${stdcover[1]}% + ${stdcover[2]}%)
  </c:forEach>
</coveragelabel>
  
<elementsdiv>
<table style="border:0">
  <c:forEach items="${icmelements}" var="elementline" varStatus="loopout">
    <c:set var="elem" value="${elementline[0]}" />
    <c:set var="rows" value="${elementline[1].size()}" />
    <c:forEach items="${elementline[1]}" var="match" varStatus="loop">
      <c:set var="color" value="style='background-color:#F0F0F0'"/>
      <c:if test="${loop.index%2 == 0}"><c:set var="color" value=""/></c:if>
      <tr ${color}>
        <td style="width: 250px" title="${match.source.definition}">${match.source.model}:&nbsp;${match.source}</td>
        <td style="text-align: center">${match.matchType.abbreviation}</td>
        <c:if test="${loop.index == 0}">
          <td style="width: 150px" rowspan="${rows}"><b>${elem}</b> <br />(${elem.basetypes[0]})</td>
          <td style="width: 400px" rowspan="${rows}" style="font-size: 90%">
            <span style="cursor:pointer" onclick="editDefinition('${elem.id}', '${elem.definition}')"> ${elem.definition}</span>
          </td>
          <td rowspan="${rows}">
            <img src="images/favicon-remove.ico" title="Remove Element" width="16px" style="cursor: pointer"
            onclick="showQuestion('Do you want to remove the element <b>${elem}</b> together with all its matches?', function() {removeElement('${elem.id}');})" /></td>
        </c:if>
      </tr>
    </c:forEach>
  </c:forEach>
</table>
</elementsdiv>

<messagediv>${message}</messagediv>

<questiontext>${question}</questiontext>

</data>