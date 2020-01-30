/**
 */
package de.cau.cs.kieler.osgiviz.osgivizmodel.impl;

import de.cau.cs.kieler.osgiviz.osgivizmodel.IVisualizationContext;
import de.cau.cs.kieler.osgiviz.osgivizmodel.OsgivizmodelPackage;
import de.cau.cs.kieler.osgiviz.osgivizmodel.PackageObjectContext;
import de.cau.cs.kieler.osgiviz.osgivizmodel.PackageObjectOverviewContext;

import de.scheidtbachmann.osgimodel.PackageObject;
import java.util.Collection;
import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentWithInverseEList;
import org.eclipse.emf.ecore.util.EObjectResolvingEList;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.util.InternalEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Package Object Overview Context</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getChildContexts <em>Child Contexts</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getModelElement <em>Model Element</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getParent <em>Parent</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#isExpanded <em>Expanded</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getCollapsedPackageObjectContexts <em>Collapsed Package Object Contexts</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getDetailedPackageObjectContexts <em>Detailed Package Object Contexts</em>}</li>
 *   <li>{@link de.cau.cs.kieler.osgiviz.osgivizmodel.impl.PackageObjectOverviewContextImpl#getPackageObjects <em>Package Objects</em>}</li>
 * </ul>
 *
 * @generated
 */
public class PackageObjectOverviewContextImpl extends MinimalEObjectImpl.Container implements PackageObjectOverviewContext {
	/**
	 * The cached value of the '{@link #getChildContexts() <em>Child Contexts</em>}' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getChildContexts()
	 * @generated
	 * @ordered
	 */
	protected EList<IVisualizationContext<?>> childContexts;

	/**
	 * The cached value of the '{@link #getModelElement() <em>Model Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getModelElement()
	 * @generated
	 * @ordered
	 */
	protected EList<PackageObject> modelElement;

	/**
	 * The default value of the '{@link #isExpanded() <em>Expanded</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isExpanded()
	 * @generated
	 * @ordered
	 */
	protected static final boolean EXPANDED_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isExpanded() <em>Expanded</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isExpanded()
	 * @generated
	 * @ordered
	 */
	protected boolean expanded = EXPANDED_EDEFAULT;

	/**
	 * The cached value of the '{@link #getCollapsedPackageObjectContexts() <em>Collapsed Package Object Contexts</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getCollapsedPackageObjectContexts()
	 * @generated
	 * @ordered
	 */
	protected EList<PackageObjectContext> collapsedPackageObjectContexts;

	/**
	 * The cached value of the '{@link #getDetailedPackageObjectContexts() <em>Detailed Package Object Contexts</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getDetailedPackageObjectContexts()
	 * @generated
	 * @ordered
	 */
	protected EList<PackageObjectContext> detailedPackageObjectContexts;

	/**
	 * The cached value of the '{@link #getPackageObjects() <em>Package Objects</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getPackageObjects()
	 * @generated
	 * @ordered
	 */
	protected EList<PackageObject> packageObjects;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected PackageObjectOverviewContextImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return OsgivizmodelPackage.Literals.PACKAGE_OBJECT_OVERVIEW_CONTEXT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EList<IVisualizationContext<?>> getChildContexts() {
		if (childContexts == null) {
			childContexts = new EObjectContainmentWithInverseEList<IVisualizationContext<?>>(IVisualizationContext.class, this, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS, OsgivizmodelPackage.IVISUALIZATION_CONTEXT__PARENT);
		}
		return childContexts;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public EList<PackageObject> getModelElement() {
		if (modelElement != null && ((EObject)modelElement).eIsProxy()) {
			InternalEObject oldModelElement = (InternalEObject)modelElement;
			modelElement = (EList<PackageObject>)eResolveProxy(oldModelElement);
			if (modelElement != oldModelElement) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT, oldModelElement, modelElement));
			}
		}
		return modelElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<PackageObject> basicGetModelElement() {
		return modelElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void setModelElement(EList<PackageObject> newModelElement) {
		EList<PackageObject> oldModelElement = modelElement;
		modelElement = newModelElement;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT, oldModelElement, modelElement));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public IVisualizationContext<?> getParent() {
		if (eContainerFeatureID() != OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT) return null;
		return (IVisualizationContext<?>)eContainer();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public IVisualizationContext<?> basicGetParent() {
		if (eContainerFeatureID() != OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT) return null;
		return (IVisualizationContext<?>)eInternalContainer();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NotificationChain basicSetParent(IVisualizationContext<?> newParent, NotificationChain msgs) {
		msgs = eBasicSetContainer((InternalEObject)newParent, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT, msgs);
		return msgs;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void setParent(IVisualizationContext<?> newParent) {
		if (newParent != eInternalContainer() || (eContainerFeatureID() != OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT && newParent != null)) {
			if (EcoreUtil.isAncestor(this, newParent))
				throw new IllegalArgumentException("Recursive containment not allowed for " + toString());
			NotificationChain msgs = null;
			if (eInternalContainer() != null)
				msgs = eBasicRemoveFromContainer(msgs);
			if (newParent != null)
				msgs = ((InternalEObject)newParent).eInverseAdd(this, OsgivizmodelPackage.IVISUALIZATION_CONTEXT__CHILD_CONTEXTS, IVisualizationContext.class, msgs);
			msgs = basicSetParent(newParent, msgs);
			if (msgs != null) msgs.dispatch();
		}
		else if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT, newParent, newParent));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean isExpanded() {
		return expanded;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void setExpanded(boolean newExpanded) {
		boolean oldExpanded = expanded;
		expanded = newExpanded;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__EXPANDED, oldExpanded, expanded));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EList<PackageObjectContext> getCollapsedPackageObjectContexts() {
		if (collapsedPackageObjectContexts == null) {
			collapsedPackageObjectContexts = new EObjectResolvingEList<PackageObjectContext>(PackageObjectContext.class, this, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__COLLAPSED_PACKAGE_OBJECT_CONTEXTS);
		}
		return collapsedPackageObjectContexts;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EList<PackageObjectContext> getDetailedPackageObjectContexts() {
		if (detailedPackageObjectContexts == null) {
			detailedPackageObjectContexts = new EObjectResolvingEList<PackageObjectContext>(PackageObjectContext.class, this, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__DETAILED_PACKAGE_OBJECT_CONTEXTS);
		}
		return detailedPackageObjectContexts;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EList<PackageObject> getPackageObjects() {
		if (packageObjects == null) {
			packageObjects = new EObjectResolvingEList<PackageObject>(PackageObject.class, this, OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PACKAGE_OBJECTS);
		}
		return packageObjects;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public NotificationChain eInverseAdd(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				return ((InternalEList<InternalEObject>)(InternalEList<?>)getChildContexts()).basicAdd(otherEnd, msgs);
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				if (eInternalContainer() != null)
					msgs = eBasicRemoveFromContainer(msgs);
				return basicSetParent((IVisualizationContext<?>)otherEnd, msgs);
		}
		return super.eInverseAdd(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				return ((InternalEList<?>)getChildContexts()).basicRemove(otherEnd, msgs);
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				return basicSetParent(null, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eBasicRemoveFromContainerFeature(NotificationChain msgs) {
		switch (eContainerFeatureID()) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				return eInternalContainer().eInverseRemove(this, OsgivizmodelPackage.IVISUALIZATION_CONTEXT__CHILD_CONTEXTS, IVisualizationContext.class, msgs);
		}
		return super.eBasicRemoveFromContainerFeature(msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				return getChildContexts();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT:
				if (resolve) return getModelElement();
				return basicGetModelElement();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				if (resolve) return getParent();
				return basicGetParent();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__EXPANDED:
				return isExpanded();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__COLLAPSED_PACKAGE_OBJECT_CONTEXTS:
				return getCollapsedPackageObjectContexts();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__DETAILED_PACKAGE_OBJECT_CONTEXTS:
				return getDetailedPackageObjectContexts();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PACKAGE_OBJECTS:
				return getPackageObjects();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				getChildContexts().clear();
				getChildContexts().addAll((Collection<? extends IVisualizationContext<?>>)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT:
				setModelElement((EList<PackageObject>)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				setParent((IVisualizationContext<?>)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__EXPANDED:
				setExpanded((Boolean)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__COLLAPSED_PACKAGE_OBJECT_CONTEXTS:
				getCollapsedPackageObjectContexts().clear();
				getCollapsedPackageObjectContexts().addAll((Collection<? extends PackageObjectContext>)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__DETAILED_PACKAGE_OBJECT_CONTEXTS:
				getDetailedPackageObjectContexts().clear();
				getDetailedPackageObjectContexts().addAll((Collection<? extends PackageObjectContext>)newValue);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PACKAGE_OBJECTS:
				getPackageObjects().clear();
				getPackageObjects().addAll((Collection<? extends PackageObject>)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				getChildContexts().clear();
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT:
				setModelElement((EList<PackageObject>)null);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				setParent((IVisualizationContext<?>)null);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__EXPANDED:
				setExpanded(EXPANDED_EDEFAULT);
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__COLLAPSED_PACKAGE_OBJECT_CONTEXTS:
				getCollapsedPackageObjectContexts().clear();
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__DETAILED_PACKAGE_OBJECT_CONTEXTS:
				getDetailedPackageObjectContexts().clear();
				return;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PACKAGE_OBJECTS:
				getPackageObjects().clear();
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__CHILD_CONTEXTS:
				return childContexts != null && !childContexts.isEmpty();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__MODEL_ELEMENT:
				return modelElement != null;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PARENT:
				return basicGetParent() != null;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__EXPANDED:
				return expanded != EXPANDED_EDEFAULT;
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__COLLAPSED_PACKAGE_OBJECT_CONTEXTS:
				return collapsedPackageObjectContexts != null && !collapsedPackageObjectContexts.isEmpty();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__DETAILED_PACKAGE_OBJECT_CONTEXTS:
				return detailedPackageObjectContexts != null && !detailedPackageObjectContexts.isEmpty();
			case OsgivizmodelPackage.PACKAGE_OBJECT_OVERVIEW_CONTEXT__PACKAGE_OBJECTS:
				return packageObjects != null && !packageObjects.isEmpty();
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuilder result = new StringBuilder(super.toString());
		result.append(" (expanded: ");
		result.append(expanded);
		result.append(')');
		return result.toString();
	}

} //PackageObjectOverviewContextImpl